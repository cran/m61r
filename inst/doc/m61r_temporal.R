## ----setup, include=FALSE-----------------------------------------------------
library(m61r)


## ----example1-----------------------------------------------------------------
raw_data <- data.frame(
  timestamp = as.POSIXct(c("2023-01-01 10:00:00", "2023-01-01 11:30:00")),
  value = c(10, 20)
)
data <- m61r(raw_data)

data$mutate(
  year  = ~format(timestamp, "%Y"),
  hour  = ~as.POSIXlt(timestamp)$hour
)


## ----step1--------------------------------------------------------------------
df_intervals <- data.frame(
  id = 1,
  start = as.POSIXct("2025-01-01 08:00"),
  end   = as.POSIXct("2025-01-01 10:00"),
  load  = 100
)

p <- m61r(df_intervals)
p$mutate(slot = ~Map(function(s, e) seq(s, e, by = "hour"), start, end))


## ----step2--------------------------------------------------------------------
p$explode("slot")
p$head()


## ----as_of_example------------------------------------------------------------
prices <- data.frame(
  ts = as.POSIXct("2025-01-01 08:00") + c(0, 3600),
  val = c(10, 12)
)

df_sync <- data.frame(ts = as.POSIXct("2025-01-01 09:30"), event = "Trade")
p_sync <- m61r(df_sync)
p_sync$join_asof(prices, by_x = "ts", by_y = "ts", direction = "backward")


## ----step4--------------------------------------------------------------------
df_dates <- data.frame(
  id = 1:2,
  entry = as.Date(c("2020-01-01", "2021-01-01")),
  exit  = as.Date(c("2020-06-01", "2021-06-01"))
)

p_dates <- m61r(df_dates)
p_dates$mutate(year = ~as.POSIXlt(entry)$year + 1900)
p_dates$head()


## ----temporal_aggregation-----------------------------------------------------
# Create a dataset with random timestamps within a day
set.seed(123)
ts_data <- data.frame(
  time = as.POSIXct("2025-01-01 00:00:00") + runif(50, 0, 86400),
  consumption = rnorm(50, 500, 100)
)

p_agg <- m61r(ts_data)

p_agg$mutate(hour_bin = ~format(time, "%Y-%m-%d %H:00"))
p_agg$group_by(~hour_bin)
p_agg$summarise(
  n_obs = ~length(consumption),
  avg_load = ~mean(consumption)
)

p_agg$head(5)

