package attestation.slsa1
import future.keywords.if

approved_repos := [
    "https://github.com/cplee/gh-attest-demo",
]

# Fail closed
default allow := false

# Allow if the repository is in the approved_repos list and the predicateType matches
allow {
    some i
    # Check if the predicateType matches the required type
    input[i].verificationResult.statement.predicateType == "https://slsa.dev/provenance/v1"

    # Attempt to safely assign the repo variable
    repo := input[i].verificationResult.statement.predicate.buildDefinition.externalParameters.workflow.repository

    repo == approved_repos[_]
}