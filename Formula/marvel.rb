class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.215441.4ef7222"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-215441-4ef7222/marvel-darwin-arm64"
    sha256 "e8a0a443f4ae9bd2c7230b4a667a089e5c0e1e674ef60a9d16c0ff9323f64eb4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-215441-4ef7222/marvel-darwin-amd64"
    sha256 "31619eb4d0a4c61e9c1fa5b4235eb73ba1a9d987663d47aacdab580c060e4929"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-215441-4ef7222/marvel-linux-arm64"
    sha256 "4fad45180e0938b309b181e45b1d667bc8c94644d5cf80abb9fee0a2d8495974"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-215441-4ef7222/marvel-linux-amd64"
    sha256 "b4ababe223ddcfafc3366069ce8ae06796fd4a59d3a9273a8d16541cbf532bfc"
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
