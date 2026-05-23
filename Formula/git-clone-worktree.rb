class GitCloneWorktree < Formula
  desc "Clones a bare git repo and checks out the default branch as a worktree"
  homepage "https://github.com/fgallardograzio/git-clone-worktree"

  url "https://github.com/fgallardograzio/git-clone-worktree/releases/download/v1.0.1/git-clone-worktree-v1.0.1.tar.gz"
  sha256 "a04cd3eddd3d34e78dbc5aef492f98259b87b90dc250c5b56b35a2304de46c3b"
  license "MIT"

  bottle do
    root_url "https://github.com/fgallardograzio/homebrew-tap/releases/download/git-clone-worktree-1.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "76ee9dee27abf0df89f6b8f88eb16f0481cee380429ce391fb0b7bf8625bdf66"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b1afeaa53dfc545b69d1add08764261062b624a5a6d6aedb12e6721d7bff9467"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "172da214cd2c49e43133e0f3b02344489ae54fa2516cc6f0b5755a3d9e1305f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2e212d808c06cabc10f1b3bf426cc0d0028e7571c92d5e053b3a8a6a89ea73e1"
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
