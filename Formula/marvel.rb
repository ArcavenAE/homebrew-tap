class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.042111.71239c9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-042111-71239c9/marvel-darwin-arm64"
    sha256 "be11838ab99851eede19378856220274215ea5117cdea1eb3ad73a82200da26a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-042111-71239c9/marvel-darwin-amd64"
    sha256 "cd19b682a03099e1fc67a90c4434fa2763ee09a8cac67e8580727ad4d350f08e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-042111-71239c9/marvel-linux-arm64"
    sha256 "fd3fb28eb14bc574607db97af6a233dd3da0f2c3b1189600df7837fc925e9507"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-042111-71239c9/marvel-linux-amd64"
    sha256 "b3c34df8c645fe15922999c41142f9295a60a88125c4e8f44616b85dea78e64f"
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
