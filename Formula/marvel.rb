class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.233235.863d538"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233235-863d538/marvel-darwin-arm64"
    sha256 "72f3d92948033a37cd8ba8dc37aeb96ce7291b6f316b047deee6dd16fb3d1f1b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233235-863d538/marvel-darwin-amd64"
    sha256 "42cbe6a1420da2d5067dc997a5ae9001cbe7b2fed9cbd532794fee607d24b4ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233235-863d538/marvel-linux-arm64"
    sha256 "895879d6aba2cc4a507f67635042e565cbd40a003cb6e4354f5ccf7e634c94f9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-233235-863d538/marvel-linux-amd64"
    sha256 "ee937fc54e0803ae1b00d36d14ad6a95fdbe3566f090908480b3a5db12eb824f"
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
