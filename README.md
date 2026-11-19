# Stellar Motion & Redshift Spectrum Analysis (MATLAB)

An astrophysical data analysis project implemented in **MATLAB** to calculate the radial velocities of stars relative to Earth using the Doppler shift of the Hydrogen-alpha ($H_\alpha$) spectral absorption line.

## Overview

When a star moves toward or away from Earth, the wavelengths of light emitted or absorbed by its elements shift due to the **Doppler Effect**:
- **Redshift ($z > 0$, $v > 0$):** The observed $H_\alpha$ absorption dip shifts to a longer wavelength than the laboratory reference ($656.28\text{ nm}$), indicating the star is moving **away** from Earth.
- **Blueshift ($z \le 0$, $v \le 0$):** The observed $H_\alpha$ absorption dip shifts to a shorter wavelength, indicating the star is moving **toward** Earth.

## Key Formulas

1. **Redshift Factor ($z$):**
   $$z = \frac{\lambda_{H\alpha}}{656.28} - 1$$
2. **Radial Velocity ($v$):**
   $$v = z \times 299792.458\text{ km/s}$$

## Features & MATLAB Techniques Used
- **Vectorized Array Operations:** Simultaneous computation of spectral minimums, redshift factors, and velocities across multiple stars without nested loops.
- **Conditional Visualization (`for` + `if-else`):** Differentiates blueshifted spectra (dashed lines) from redshifted spectra (thick solid lines) on a unified comparative plot.
- **Logical Indexing:** Extracts the catalog names (`starnames`) of receding stars (`speed > 0`) cleanly in a single expression.

## Repository Structure
- `stellar_motion_analysis.m` — Main MATLAB script performing single-star inspection, vectorized velocity calculations, and multi-star spectral plotting.
- `README.md` — Project documentation and methodology.
