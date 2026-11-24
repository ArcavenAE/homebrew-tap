class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.183144.f080235"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-183144-f080235/marvel-darwin-arm64"
    sha256 "47842a0e3eea0a5914e830558c344ae3fbd6797b76bc2ab637a34a7e7baa5553"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-183144-f080235/marvel-darwin-amd64"
    sha256 "e402d25ba57c3711143a8e6ba1d4b5709ff4a304546d5e44fe0a7899766c3aa9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-183144-f080235/marvel-linux-arm64"
    sha256 "0c1857b1745f88a808fed79c947adf7d5afec560b1a12d7daa46f5ca7fe69a44"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-183144-f080235/marvel-linux-amd64"
    sha256 "4d699fed63cd3ddf4bbdf85ad4b8b3d6959e81df1c4545f4fef24c1b349c9c34"
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
