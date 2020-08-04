data {
  int nobs;
  vector[nobs] xobs;
  vector[nobs] yobs;
  vector[nobs] sigma_y;
  vector[nobs] sigma_x;
}

parameters {
  real m;
  real b;
  vector[nobs] x_true;
}

transformed parameters {
  vector[nobs] y_true = (m*xobs + b);
}

model {
  /* Flat in m and b. */

  /* y is drawn from a normal distribution */ 
  yobs ~ normal(y_true, sigma_y);
  xobs ~ normal(x_true, sigma_x);
}
