class GitCloneWorktree < Formula
  desc "Clones a bare git repo and checks out the default branch as a worktree"
  homepage "https://github.com/fgallardograzio/git-clone-worktree"

  url "https://github.com/fgallardograzio/git-clone-worktree/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d392fab67c75ee8ba0aaf5e8a9418dfad8277d87dc5f0e155ed53ee35c12b60e"
  license "MIT"

  bottle do
    root_url "https://github.com/fgallardograzio/homebrew-tap/releases/download/git-clone-worktree-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "df6f1a523ef36b553f2d033d920edb969caed15ac3c45691b2fada51bcfd0b8d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c42cad0d2619f630cc16f13090e5011af65736488d715bf923d4281e1e8288cc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e3a1b4fff48127794aa1ed3dff8afd3cb6bf546a244d63dcf08474e3395dd4ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "52628bfe4ce0fd895268af5facbc42dd2973fc8f5fee64688b34ba8b43ee3e8b"
  end

  depends_on "pandoc" => :build

  def install
    system "pandoc", "-f", "markdown-smart", "-s", "-t", "man",
           "docs/git-clone-worktree.1.md", "-o", "git-clone-worktree.1"

    man1.install "git-clone-worktree.1"
    bin.install "src/git-clone-worktree"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/git-clone-worktree --help")
  end
end
