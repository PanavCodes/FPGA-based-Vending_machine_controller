# 🥤 FPGA Vending Machine Controller

A simple **Verilog HDL vending machine controller** implemented on the **Altera Cyclone II EP2C5T144C8N FPGA board**.  
This project simulates a vending process using **LEDs and push buttons**, demonstrating the use of **Finite State Machines (FSM)** in digital logic design.

---

## 🎯 Features

- Designed in **Verilog (Quartus II 13.0)**  
- Uses **Finite State Machine (FSM)** for control flow  
- **4 LEDs** indicate machine states  
- **2 Push buttons** simulate coin insert & selection  
- Optional **Reset button** to restart the machine  
- Built for **Cyclone II EP2C5T144C8N** FPGA board

---

## ⚙️ Hardware Components

| Component | Quantity | Function |
|------------|-----------|----------|
| Cyclone II EP2C5T144C8N Board | 1 | Main FPGA |
| Push Buttons | 2 | Coin and Select |
| LEDs | 4 | State Indicators |
| Resistors (330 Ω) | 4 | LED current limiters |
| Resistors (10 kΩ) | 2 | Pull-down resistors for buttons |
| Breadboard & Jumper Wires | — | Connections |

---

## 💡 LED Indicators

| LED | FPGA Pin | Color | Meaning |
|------|-----------|--------|----------|
| `led_ready` | PIN 55 | 🟢 Green | Machine Ready |
| `led_busy` | PIN 57 | 🟡 Yellow | Processing |
| `led_done` | PIN 58 | 🔵 Blue | Dispensed |
| `led_error` | PIN 59 | 🔴 Red | Error (future use) |

---

## 🔘 Push Button Inputs

| Button | Signal | FPGA Pin | Function |
|---------|---------|-----------|-----------|
| Coin Button | `btn_coin` | PIN 52 | Insert Coin |
| Select Button | `btn_select` | PIN 53 | Select Item |
| Reset Button | `rst_n` | PIN 43 | Active Low Reset |

---

## 🧩 FSM States

| State | Description |
|--------|--------------|
| `IDLE` | Machine waiting for coin |
| `COIN_IN` | Coin detected |
| `SELECTING` | Waiting for item selection |
| `DISPENSING` | Simulating vending delay |
| `DONE` | Item dispensed |
| `ERROR` | Invalid input (reserved) |

---

## 🧠 Working Logic

1. Power on → Green LED (Ready)  
2. Press Coin → Yellow LED (Coin accepted)  
3. Press Select → Yellow LED (Processing)  
4. After 0.5s delay → Blue LED (Item delivered)  
5. Machine resets to Ready (Green LED)

---

## 🔧 How to Compile

1. Open **Quartus II 13.0 SP1**  
2. Create a new project named `vending_machine`  
3. Add `vending_machine.v` and `vending_top.v`  
4. Assign FPGA pins as shown above  
5. Compile and program the `.sof` file to your board  
6. Observe LED behavior as per the FSM

---

## 📂 Folder Structure


Vending-Machine-FPGA/
├── src/
│ ├── vending_machine.v
│ ├── vending_top.v
│ └── button_test.v
├── quartus_project/
│ ├── vending_machine.qpf
│ ├── vending_machine.qsf
│ ├── pin_assignments.txt
│ └── output_files/
├── images/
│ ├── wiring_diagram.png
│ └── board_photo.jpg
└── README.md


---

## 🧰 Tools Used

- **Intel Quartus II 13.0 SP1 Web Edition**  
- **ModelSim-Altera** (optional for simulation)

---


## ⚖️ License

This project is licensed under the [MIT License](LICENSE).
