class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.072900.1120035"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072900-1120035/marvel-darwin-arm64"
    sha256 "88cb5f528e62d6384a1f535797476195930fca35692e6617fa39697fff1ed7e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072900-1120035/marvel-darwin-amd64"
    sha256 "b289af8aa9b804ee255ba1681d083ff8c31209c1467169c75a9f7f50544ebdf9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072900-1120035/marvel-linux-arm64"
    sha256 "897ce95cce9a58a7bdedb2beaeabc41fb16ce220f5c94d425c80477ed5ba3911"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072900-1120035/marvel-linux-amd64"
    sha256 "87412d2458ac806b54d910e8f53b3dd1a031548d232082b81f73d10179294d2d"
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
