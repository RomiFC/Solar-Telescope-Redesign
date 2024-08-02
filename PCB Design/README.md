# Changelog

## Revision B - 7/24/2024

### Added

- Board characteristics to assembly drawing.
- Board dimensioning to assembly drawing.
- Test points at different stages of amplification.
- Layer indicator to top left of assembly drawing.
- L7912C Negative LDO (Will require additional power supply).
- Summing amplifier stage which will subtract a voltage from the output of the ADL5902-EVALZ in attempt to bring the noise floor closer to 0VDC

### Changed

- Stackup changed from 2-layer, 30 mil RO4350b to 2-layer OSHPark specifications.
- Removed SMA connectors that allowed the stages of the PCB to be used independently as that functionality was not significant.
- Removed ADL5902 Power Detector IC and replaced with a footprint to mount the ADL5902-EVALZ directly on top. Oscillations were detected and further testing is not possible within the current time frame.
- L78XX TO-220 replaced with D2PAK.

### Fixed

- Removed front and back mask from linear regulator pads to improve thermal conductance.
- 15V silkscreen text now correctly reads 12V
- Board dimensions and mounting hole patterns are rounded to clean values (5.05" x 1.8").

## Revision A - 6/29/2023

### First revision 🎉🎉🎉

- This directory contains KiCad files for the PCB. The PCB contains a 15V/5V 1A power supply, an ADL5902 power detector, and a dual LM358 non-inverting amplifier. It was designed to allow users to utilize the individual stages on projects outside of this application.
