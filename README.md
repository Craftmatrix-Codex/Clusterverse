# Clusterverse

> A calm, open-source control plane for applications across K3s clusters.

Clusterverse is an early-stage project from [Craftmatrix-Codex](https://github.com/Craftmatrix-Codex). It aims to make deploying and operating applications on K3s clear, approachable, and powerful—without hiding Kubernetes behind a cluttered interface.

## Status

**Pre-alpha / design phase.** Clusterverse is not ready for production use yet. APIs, architecture, and workflows will change as we learn.

## Vision

Clusterverse is being designed for people who want:

- a focused interface for K3s and lightweight Kubernetes;
- Git-based application deployments;
- clear workload, rollout, and health visibility;
- straightforward domains, TLS, configuration, and secrets;
- sensible defaults without taking control away from operators;
- an open project that is easy to understand, run, and contribute to.

## Planned direction

The first milestone is expected to focus on connecting to a K3s cluster, deploying from Git, viewing workloads/logs/events/rollouts, managing configuration safely, and exposing applications through domains and TLS.

This list is directional, not a promise. See the issue tracker for current work and discussion.

## Why K3s?

K3s makes Kubernetes practical on small servers, homelabs, edge machines, and focused production environments. Clusterverse treats those environments as a first-class use case.

## Contributing

Contributions, questions, design feedback, and honest criticism are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening an issue or pull request. Beginner-friendly participation is encouraged.

Please also read the [Code of Conduct](CODE_OF_CONDUCT.md). Security issues should be reported privately as described in [SECURITY.md](SECURITY.md).

## License

Clusterverse is released under the [Apache License 2.0](LICENSE).
