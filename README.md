# Basys3 3-Axis Accelerometer SPI Interface

This repository provides an FPGA-based implementation for interfacing with a 3-axis accelerometer using the SPI protocol. The design is optimized for the **Basys3 FPGA board** and includes modules for SPI communication, clock generation, and 7-segment display control to showcase the accelerometer data.

---

## 🌟 Features
- **SPI Master**: A robust SPI implementation for communicating with the accelerometer.
- **Clock Generator**: Provides the required clock signal for the SPI interface.
- **7-Segment Display Control**: Displays real-time accelerometer data on the Basys3 board.
- **FPGA Compatibility**: Designed for the Basys3 FPGA with pin constraints.

---

## 📂 Repository Structure

```plaintext
Accel_tryfromzero/
├── Accel_tryfromzero.srcs/
│   ├── constrs_1/
│   │   └── imports/Basys3 3-Axis Accelerometer SPI/
│   │       └── const_accelerometer.xdc   # Xilinx constraints for Basys3
│   ├── sources_1/
│   │   └── imports/Basys3 3-Axis Accelerometer SPI/
│   │       ├── iclk_gen.v               # Clock generation module
│   │       ├── seg7_control.v           # 7-segment display controller
│   │       ├── spi_master.v             # SPI Master implementation
│   │       └── top.v                    # Top-level design integrating all modules
└── README.md                            # Project documentation
```

---

## 🚀 Getting Started

### Prerequisites
1. **Hardware**: Basys3 FPGA development board and a 3-axis accelerometer module.
2. **Software**: Xilinx Vivado (2020.2 or later recommended).
3. **Simulation Tools**: Vivado Simulator.

---

### 🔧 Setup Instructions

#### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/Basys3-Accelerometer-SPI.git
cd Basys3-Accelerometer-SPI
```

#### 2️⃣ Connect Hardware
- Connect the 3-axis accelerometer to the Basys3 board as per the pin assignments in `const_accelerometer.xdc`.

#### 3️⃣ Open the Project in Vivado
1. Launch **Xilinx Vivado**.
2. Create a new project or open an existing one.
3. Add the source files (`iclk_gen.v`, `spi_master.v`, `seg7_control.v`, `top.v`) to the project.
4. Add the constraints file (`const_accelerometer.xdc`) to the project.

#### 4️⃣ Simulate the Design
Run simulations in Vivado:
1. Go to the **Simulation** section in Vivado.
2. Add `top.v` as the top module for simulation.
3. Run the simulation and analyze the waveforms.

#### 5️⃣ Synthesize and Implement
1. Click **Run Synthesis** in Vivado.
2. Once synthesis is complete, click **Run Implementation**.
3. Generate the bitstream file.

#### 6️⃣ Load the Bitstream
Load the generated `.bit` file onto the Basys3 board and observe real-time accelerometer readings on the 7-segment display.

---

## 📊 Module Descriptions

- **`iclk_gen.v`**: Generates the clock signal required for SPI communication.
- **`spi_master.v`**: Manages SPI communication with the accelerometer.
- **`seg7_control.v`**: Converts accelerometer data for display on a 7-segment display.
- **`top.v`**: Integrates all modules into a single top-level design.

---

## 📖 Documentation

- **[Constraints File](Accel_tryfromzero.srcs/constrs_1/imports/Basys3 3-Axis Accelerometer SPI/const_accelerometer.xdc)**: Pin mappings for the Basys3 FPGA board.
- **[Module Files](Accel_tryfromzero.srcs/sources_1/imports/Basys3 3-Axis Accelerometer SPI/)**: Source files for SPI, clock generation, and 7-segment control.

---

## 🤝 Contribution Guidelines

We welcome contributions! To contribute:
1. **Fork the repository**.
2. **Create a feature branch**:
   ```bash
   git checkout -b feature-name
   ```
3. **Commit and push your changes**:
   ```bash
   git commit -m "Add feature-name"
   git push origin feature-name
   ```
4. **Open a Pull Request**.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

### ✨ Let's Build Together!

Feel free to open an issue if you encounter any problems or have suggestions. Happy coding! 🚀
