[![Pub Package](https://img.shields.io/pub/v/ripple_effect.svg?color=0175C2)](https://pub.dev/packages/particle_fountain)
[![GitHub Link](https://img.shields.io/github/last-commit/helloparthshah/particle_fountain)](https://github.com/helloparthshah/particle_fountain)
# particle_fountain

Easily create particle fountains

<p align="center">
  <img src="./untitled.gif" width="240">
</p>

## Usage

Add the `particle_fountain` widget as a child to the widget you want to have the particle fountain in. The `particle_fountain` widget will take the entire parent widget and the height and width of the particles can be adjusted using the `height` and `width`. 

## Example

```
Container(
    child: ParticleFountain(
        numberOfParticles: 30,
        height: h,
        width: w,
        color: Colors.orange.withAlpha(150),
    ),
),
```
