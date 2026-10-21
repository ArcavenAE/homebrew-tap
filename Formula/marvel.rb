class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.214256.9ead641"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-214256-9ead641/marvel-darwin-arm64"
    sha256 "0bba794738e18504ad3436fb81d5ec63e54fefd7e1c41d6df1c4ab5a4a2fb024"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-214256-9ead641/marvel-darwin-amd64"
    sha256 "9fb2c3af01eef53544c731fcf48a5ff2cfa4aa97e62377861480150b9df3e307"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-214256-9ead641/marvel-linux-arm64"
    sha256 "e451adb7e3c241673139d20735bdf000d4794bba0d258c10561ee092949181b8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-214256-9ead641/marvel-linux-amd64"
    sha256 "6618b9f165070c6e498246e0c44b40354bb9d9b1b52553559eb1d43e8e018bf0"
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
