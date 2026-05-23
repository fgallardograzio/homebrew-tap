class GitCloneWorktree < Formula
  desc "Clones a bare git repo and checks out the default branch as a worktree"
  homepage "https://github.com/fgallardograzio/git-clone-worktree"

  url "https://github.com/fgallardograzio/git-clone-worktree/releases/download/v1.0.1/git-clone-worktree-v1.0.1.tar.gz"
  sha256 "a04cd3eddd3d34e78dbc5aef492f98259b87b90dc250c5b56b35a2304de46c3b"
  license "MIT"

  bottle do
    root_url "https://github.com/fgallardograzio/homebrew-tap/releases/download/git-clone-worktree-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c29b6cbc1876a019083f143ce29846f111c7e5e7bceb21296dda1132d9b5c4a6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f44c2b58e6b3cd1aaa8fa7a5dea3232e0e128942d0a9bf213707c1a139daefcf"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "deadb0030f798952d5d022fc84bd2d39e5e304ba2167f5851ec1395e5a59b9a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e7c77acce2068287589bb197a943fd95277534b1760ff2f4bb50d584eb4844be"
  end

  def install
    bin.install "src/git-clone-worktree"
    man1.install "man/git-clone-worktree.1"

    bash_completion.install "completions/git-clone-worktree.bash" => "git-clone-worktree"
    zsh_completion.install "completions/_git-clone-worktree"
    fish_completion.install "completions/git-clone-worktree.fish"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/git-clone-worktree --help")
  end
end
