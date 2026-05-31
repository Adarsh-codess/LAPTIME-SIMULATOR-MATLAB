# 🏎️ MATLAB Lap Time Simulator

A simple lap time simulator built in MATLAB to model vehicle speed across multiple track sectors using acceleration and braking logic.

## 📌 Project Overview

This project simulates how a race car accelerates on straights and brakes before corners while completing a lap.

The simulator uses:

* Track sectors with different target speeds
* Distance-based simulation
* Acceleration and braking models
* Automatic corner detection
* Speed vs Distance visualization

The goal is to understand the fundamentals of vehicle simulation, lap time prediction, and race engineering concepts.

---

## 🚀 Features

* Multi-sector track definition
* Speed targets for each sector
* Automatic sector detection
* Look-ahead braking logic
* Smooth acceleration and deceleration
* Speed profile generation
* Lap time estimation
* MATLAB visualization

---

## 📊 Example Track

| Sector | Length (m) | Target Speed (km/h) |
| ------ | ---------- | ------------------- |
| 1      | 700        | 180                 |
| 2      | 100        | 120                 |
| 3      | 300        | 190                 |
| 4      | 200        | 80                  |
| 5      | 500        | 200                 |

---

## 🧠 Simulation Logic

1. Define track sectors and target speeds.
2. Calculate cumulative track distance.
3. Move the vehicle through the track meter-by-meter.
4. Detect the current sector.
5. Calculate braking points for upcoming corners.
6. Accelerate towards target speed.
7. Brake before slower sectors.
8. Store speed data for every distance point.
9. Plot the final speed trace.

---

## 📈 Output

The simulator generates:

* Speed vs Distance Graph
* Sector-based vehicle speed profile
* Estimated Lap Time

Example:

```text
Long Straight
      ↑
180 km/h
      │
      │
      ↓
Heavy Braking
      ↓
120 km/h Corner
```

---

## 🛠️ Tools Used

* MATLAB
* MATLAB Plotting Functions
* Vehicle Dynamics Fundamentals
* Basic Simulation Techniques

---

## 📚 Concepts Applied

* Kinematics
* Vehicle Acceleration
* Braking Dynamics
* Lap Time Analysis
* Track Segmentation
* State-Based Vehicle Behaviour

---

## 🎯 Future Improvements

* Realistic vehicle acceleration model
* Aerodynamic drag
* Rolling resistance
* Tire grip limits
* Corner radius calculations
* Gear shifting logic
* Telemetry dashboard integration
* Simulink implementation

---

## 👨‍💻 Author

**Adarsh Behera**

Mechanical Engineering Student
Odisha University of Technology and Research (OUTR)

Interested in:

* Vehicle Dynamics
* Race Engineering
* Telemetry Analysis
* Simulation Engineering
* Motorsport Technology

---

*"Every tenth of a second starts with understanding where it was lost."*
