class GitCloneWorktree < Formula
  desc "Clones a bare git repo and checks out the default branch as a worktree"
  homepage "https://github.com/fgallardograzio/git-clone-worktree"

  url "https://github.com/fgallardograzio/git-clone-worktree/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d392fab67c75ee8ba0aaf5e8a9418dfad8277d87dc5f0e155ed53ee35c12b60e"
  license "MIT"

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
