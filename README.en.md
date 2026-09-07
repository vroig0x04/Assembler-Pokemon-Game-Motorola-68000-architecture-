# Pokémon Battle Simulator - Motorola 68000

## 📋 Project Description

This repository contains the complete implementation of a **Pokémon battle simulator** developed in **Motorola 68000 Assembly Language (M68K)**. The project constitutes an educational and fully functional implementation that replicates the main characteristics of the first generation Pokémon battle system, allowing interactive battles with real-time graphics and mechanics.

The system implements:

- **Turn-based battle system**: Complete turn management and attack order
- **Graphics engine**: Direct rendering on 320x240 pixel screen
- **Pokémon mechanics**: Statistics, moves, and types from Gen I
- **Interactive menu**: Navigation and Pokémon selection
- **Sound effects**: Audio integration (optional)
- **Random number generator**: For attacks and non-deterministic calculations

---

**Available in other languages:** [Español](README.md)

## 🏗️ Project Composition

```
100% - Motorola 68000 Assembly Language (M68K)
```

All project modules are developed entirely in pure assembly language.

## 🛠️ Tools and Dependencies

### System Requirements

The simulator requires the following tools:

| Tool | Purpose | Minimum Version |
|------|---------|------------------|
| **EASy68K** | IDE and assembler for Motorola 68000 | 5.0+ |
| **M68K Emulator** | Architecture simulator (included in IDE) | Compatible with M68K |
| **Multimedia Resources** | Audio/theme files (optional) | WAV/MP3 files |

### Recommended Configuration

- **IDE**: EASy68K (highly recommended)
- **Memory**: 512 KB minimum for execution
- **Resolution**: 320x240 pixels (standard Motorola 68000)
- **Processor**: Motorola 68000 or higher

## 📁 Repository Structure

```
Assembler-Pokemon-Game/
├── Main Module
│   ├── MAIN.X68                     # Main entry point
│   ├── MAIN.S68                     # Extended version with comments
│   └── MAIN.L68                     # Assembly listing (160 KB)
│
├── Interface System
│   ├── MENU.X68                     # Main menu management
│   ├── SYSMENU.X68                  # Menu system routines
│   ├── LOADSCREEN.X68               # Loading screen
│   └── THEMES.X68                   # Visual themes and audio management
│
├── Battle System
│   └── SYSBATTLE.X68                # Battle engine (19 KB)
│
├── Data and Configuration
│   ├── CONST.X68                    # Global constants and lookup tables (8 KB)
│   ├── SYSCONST.X68                 # System constants
│   ├── VARS.X68                     # Game variables
│   └── SYSVARS.X68                  # System variables
│
├── Utilities
│   ├── SYSTEM.X68                   # System functions
│   ├── FILEREADER.X68               # File reader
│   ├── RANDOM.X68                   # Random number generator
│   └── SYSEND.X68                   # Cleanup routines
│
├── README.md                        # This file
├── README.en.md                     # English version
└── README.txt                       # Additional information
```

## 🚀 Usage Guide

### 1. Initial Setup

Clone the repository:

```bash
git clone https://github.com/vroig0x04/Assembler-Pokemon-Game-Motorola-68000-architecture-.git
cd Assembler-Pokemon-Game-Motorola-68000-architecture-
```

### 2. EASy68K Configuration

1. Open **EASy68K**
2. Go to **File → Open** and select **MAIN.X68**
3. Make sure all `.X68` files are in the same directory
4. The IDE will automatically load dependencies

### 3. Assembly Compilation

To compile the assembly code:

```
1. Compile → Assemble (Ctrl+F9)
2. If there are no errors, the assembler will generate object code
```

### 4. Simulator Execution

To run the simulator:

```
1. Run → Execute (F10)
2. The Motorola 68000 emulator will start the game
3. The screen will display the game interface
```

### 5. Multimedia Configuration (Optional)

To include audio files:

1. Download the `themes` folder from the Drive link:
   ```
   https://drive.google.com/drive/folders/1o9xBbEUSeAxfoxZciXyP3HjyqYmeXVGO?usp=sharing
   ```
2. Replace the empty `themes` folder in the project
3. The game will automatically load audio files

## 🎮 Game Controls

| Control | Action |
|---------|--------|
| **← →** | Navigate menu |
| **Z** | Attack during battle |
| **X** | Restart game |
| **Space** | Exit (after losing) |

## 🔧 Phases and Components

### Phase 1: Loading and Menu
Performed by **MENU.X68** and **LOADSCREEN.X68**, manages:
- Splash screen
- Selection menu
- Resource loading

### Phase 2: Pokémon Selection
Implemented in **MAIN.X68**, allows:
- Select battle team
- View statistics
- Confirm selection

### Phase 3: Battle System
Performed by **SYSBATTLE.X68** (19 KB), includes:
- Damage calculation
- Turn management
- Attack animations
- Victory/defeat determination

### Phase 4: Data Management
Implemented in data modules:
- **CONST.X68**: Gen I Pokémon statistics
- **VARS.X68**: Current game state
- **RANDOM.X68**: Random number generator

## 📊 Main Features

### Battle System
✅ Alternating turns based on speed  
✅ Damage calculation based on move and statistics  
✅ Type system and effectiveness  
✅ Victory/defeat conditions  
✅ Real-time animations

### Generation I Pokémon
✅ All Gen I Pokémon included  
✅ Complete statistics (HP, ATK, DEF, etc.)  
✅ First generation moves  
✅ 8-bit sprite-based graphics  
✅ Complete type system

### Assembly Optimizations
✅ Modular and reusable code  
✅ Efficient register management  
✅ Fast data table access  
✅ Independent system routines  
✅ Extensive code comments

## 🧪 Test Cases

The repository includes test code in the files:

- **MAIN.S68**: Complete commented version for debugging
- **README.txt**: Additional configuration information

## ⚠️ License and Copyright

This software is the intellectual property of **Vicent Roig**. Unauthorized copying, modification, or distribution of this file, via any medium, is strictly prohibited.

## 🤝 Contributing

Contributions are not accepted at this time given the proprietary nature of the project.

## 📞 Contact

For inquiries related to this project, please contact the repository owner.

---

**Last Updated:** September 2026  
**Simulator Version:** 1.0  
**Architecture:** Motorola 68000 (M68K)
