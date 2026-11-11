class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.234420.34e61b2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-234420-34e61b2/marvel-darwin-arm64"
    sha256 "f93ac099992b073ebdd4d3c271148aa57c41782a261e71a626d24c214ce92995"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-234420-34e61b2/marvel-darwin-amd64"
    sha256 "153cf4bdf0a09951693dfa67eca6d2950e4b7ff1a0827f6b2e5ce6328634c3a2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-234420-34e61b2/marvel-linux-arm64"
    sha256 "d6bf0a31008533c4e7885c31deaedaa98faf55769b5ecb7cdf8e84d6e0a93a62"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-234420-34e61b2/marvel-linux-amd64"
    sha256 "107c86b30f087b6601d892d78fe2167d2fbf7e37231521803b9efcdd3949a46e"
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
