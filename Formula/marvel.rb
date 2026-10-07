class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.011542.5a972a4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011542-5a972a4/marvel-darwin-arm64"
    sha256 "76e4147c9a5cf49246e2ac9c4e7d6712408d2cb9b7f5e6f9047b5f3bf4f3dfa9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011542-5a972a4/marvel-darwin-amd64"
    sha256 "da45905540112235b0f56a5ee2abbf96f773524de5e59312110cc44a2ef52ddc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011542-5a972a4/marvel-linux-arm64"
    sha256 "5b4d6845e4ea97ec8fd6cff80ba4d9aaed55903b4a31b820c43c8a27a047b090"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011542-5a972a4/marvel-linux-amd64"
    sha256 "a7eeb8ae1afdfc56fcc2fd72b497babedce0258b0c58e570b2604def0889ea42"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
