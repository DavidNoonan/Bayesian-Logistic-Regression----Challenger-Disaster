data {
  int<lower = 1> N;
  vector[N] fake_temperature;
  int<lower = 0, upper = 1> failure[N];
}
parameters {
  real alpha;
  real beta;
}
model {
  failure ~ bernoulli_logit(alpha + beta*fake_temperature);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
}