# Contributing Guide

## Commit Conventions

This project follows the **Conventional Commits** specification with emojis for better readability.

### Format
```
<type>[scope]: <description>

[optional body]

[optional footer]
```

### Types
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

### Scope
The scope should indicate which part of the codebase is affected:
- `ci`: Continuous integration and workflow files
- `docs`: Documentation
- `config`: Configuration files
- `nix`: Nix-related changes

### Emojis
Add an appropriate emoji at the start of the commit message:
- ✨ `feat`: New feature
- 🐛 `fix`: Bug fix
- 📚 `docs`: Documentation
- 💅 `style`: Code style improvements
- 🔧 `refactor`: Code refactoring
- ✅ `test`: Tests
- 🔨 `chore`: Build process changes

### Examples
```
✨ feat(ci): add automated artifact upload for Proxmox images

🐛 fix(workflow): resolve missing artifact file issue in GitHub Actions

📚 docs: add contributing guidelines and commit conventions

🔧 refactor(config): improve Nix flake structure for better caching
```

### Best Practices
1. Use present tense ("add" not "added")
2. Start with a lowercase letter
3. Keep the first line under 50 characters
4. Reference issues and pull requests in the footer
5. Explain what and why in the body, not how

### Git Workflow
1. Create a feature branch from `main`
2. Make your changes
3. Test your changes
4. Commit with a proper message
5. Push and create a pull request

## Development Setup

### Prerequisites
- Nix with flakes enabled
- Git

### Getting Started
```bash
# Clone the repository
git clone <repository-url>
cd nixos2proxmox-vma

# Enable nix flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# Build the project
nix build .#proxmox-vm
```

## Project Structure
```
├── .github/workflows/    # GitHub Actions workflows
├── docs/                 # Documentation
├── configuration.nix     # NixOS system configuration
├── flake.nix            # Nix flake definition
└── README.md            # Project readme