class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.223520.c7ab41c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223520-c7ab41c/marvel-darwin-arm64"
    sha256 "73f41146e3346a86b4e943bac2d98479de1f88182804a03adfdaaec40c7beb13"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223520-c7ab41c/marvel-darwin-amd64"
    sha256 "940cd30690f4ba4c02ef2df00ea8023c5630bde0e440c7eda50f2aa8f7e2a612"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223520-c7ab41c/marvel-linux-arm64"
    sha256 "55b0ba92d267d860fab6499b5a9bcfe3415c195b25586c5331aee7f822e0ce63"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-223520-c7ab41c/marvel-linux-amd64"
    sha256 "330844d97c4dcb7aaf4c07fb4dd85e8ff30ce4966579077c7da8c2c5e073959a"
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
