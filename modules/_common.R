# Plots
theme_set(
  theme_linedraw(base_size = 13) +
    theme(panel.grid = element_blank())
)

# MCMC settings
options(
  brms.backend = Sys.getenv("BRMS_BACKEND", "rstan"),
  brms.threads = as.numeric(Sys.getenv("BRMS_THREADS"), 1),
  brms.iter = as.numeric(Sys.getenv("BRMS_ITER"), 1000),
  mc.cores = as.numeric(Sys.getenv("MAX_CORES"), 4),
  digits = 2
)

# Hack to allow using default N iterations
# library(brms)
# fargs <- formals(brm)
# fargs$iter <- getOption("brms.iter", 2000)
# formals(brm) <- fargs
