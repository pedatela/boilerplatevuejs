module.exports= {
    branches: "main",
    repositoryUrl: "https://github.com/pedatela/boilerplatevuejs" ,
    plugin: [
        "@semantic-release/commit-analyzer", 
        "@semantic-release/release-notes-generator", 
        "@semantic-release/github"
    ]
}