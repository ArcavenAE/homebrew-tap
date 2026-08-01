class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.214253.31f1ea5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-214253-31f1ea5/marvel-darwin-arm64"
    sha256 "014251bc05b7dac3f60f26a025646830fe5481c5f0a6bb5a8d9e9f3bcf5ac759"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-214253-31f1ea5/marvel-darwin-amd64"
    sha256 "11f90de4d4774324739e9146e28f84fb46abe15c2e9ca1d40bb0b701837ea664"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-214253-31f1ea5/marvel-linux-arm64"
    sha256 "55e17ded3f1cb3fe0ce6ec4f21a2cecb574e43e5723fa146406512bf0f30de9f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-214253-31f1ea5/marvel-linux-amd64"
    sha256 "bf5eecb67cf9aba010213c3823280609874812d93dba8f39fbe6a801b6f5f863"
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
