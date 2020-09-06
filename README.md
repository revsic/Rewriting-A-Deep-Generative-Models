# Rewriting-A-Deep-Generative-Models

Experiments for paper "Rewriting a deep generative models" [[GIT](https://github.com/davidbau/rewriting), [arXiv:2007.15646](https://arxiv.org/abs/2007.15646)]

- This repository aims to write a single file rewriting experiment.
- StyleGAN2 is based on NVIDIA [stylegan2](https://github.com/NVlabs/stylegan2) and rosinality [stylegan2-pytorch](https://github.com/rosinality/stylegan2-pytorch).
- Each licenses are appended to [3RD-PARTY.md](./3RD-PARTY.md)

## Sample - Feature independency

This paper says that some feature maps consist of less dependent features with their neighbors.

In experiment [FeatureIndependency.ipynb](./FeatureIndependency.ipynb), features are patched and inferenced isolately. But image represents such a good objects lack of softness.

We can assume that each features encode the object, and interprete convolution as perspective of associative memory, from disentangling the neighbors, to blending the outputs.

<img src="./rsrc/feature_indep.png" width="80%">

## Sample - Rewriting

Optimize a convolutional weight with direction of ZCA whitened C^{-1}k.

Since some feature maps consist of less dependent features, we can mask the feature maps directly with interpolated image-level mask. Then we can compute the feature map-level copy&paste and perceptual distance.

In experiment [Rewriting](./Rewriting.ipynb), convolutional weights are rewritten for copying the grass on the sharp loops.

<img src="./rsrc/rewriting.png" width="80%">
