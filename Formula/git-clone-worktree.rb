class GitCloneWorktree < Formula
  desc "Clones a bare git repo and checks out the default branch as a worktree"
  homepage "https://github.com/fgallardograzio/git-clone-worktree"

  url "https://github.com/fgallardograzio/git-clone-worktree/releases/download/v1.0.0/git-clone-worktree-v1.0.0.tar.gz"
  sha256 "a91b36101c0dd4c234966857e9180a22e2ec49452d7342dfa90a361cc188b861"
  license "MIT"

  bottle do
    root_url "https://github.com/fgallardograzio/homebrew-tap/releases/download/git-clone-worktree-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "df6f1a523ef36b553f2d033d920edb969caed15ac3c45691b2fada51bcfd0b8d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c42cad0d2619f630cc16f13090e5011af65736488d715bf923d4281e1e8288cc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e3a1b4fff48127794aa1ed3dff8afd3cb6bf546a244d63dcf08474e3395dd4ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "52628bfe4ce0fd895268af5facbc42dd2973fc8f5fee64688b34ba8b43ee3e8b"
  end

  def install
    bin.install "src/git-clone-worktree"
    man1.install "man/git-clone-worktree.1"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/git-clone-worktree --help")
  end
end
