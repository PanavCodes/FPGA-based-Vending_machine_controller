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
| Resistors (1 KΩ) | 4 | LED current limiters |
| Resistors (10 KΩ) | 2 | Pull-down resistors for buttons |
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

## 🧰 Tools Used

- **Intel Quartus II 13.0 SP1 Web Edition**  
- **ModelSim-Altera** (optional for simulation)

---

## 🔗 References

- [Altera Cyclone II FPGA Family Support – Intel Corporation](https://www.intel.com/content/www/us/en/support/programmable/support-resources/devices/cyclone-ii-support.html)  
  > Provides data sheets, device information, resources for the Cyclone II family. :contentReference[oaicite:2]{index=2}  
- [Intel Quartus II Web Edition 13.0 SP1 Download – Intel Corporation](https://www.intel.com/content/www/us/en/software-kit/711791/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-windows.html)  
  > Official download page for the version used. :contentReference[oaicite:3]{index=3}  
- [Altera Cyclone II EP2C5T144 FPGA Board Overview – Digilogic Electrónica (2016)](https://digilogicelectronica.wordpress.com/2016/07/15/altera-cyclone-ii-ep2c5t144-fpga/)  
  > Hardware reference article.  

> These references were used for hardware and tool information only.  
> All Verilog design, FSM implementation, and documentation in this repository are original.

---

## ⚖️ License

This project is licensed under the [MIT License](LICENSE).
