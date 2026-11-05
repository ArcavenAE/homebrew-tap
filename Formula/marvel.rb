class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.164429.927464b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-164429-927464b/marvel-darwin-arm64"
    sha256 "8d6ee2d98b7b9e8a3e767da2a23d4e0c086db6869dffa0aa1ec283e0e3d501ad"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-164429-927464b/marvel-darwin-amd64"
    sha256 "6dfa57d8672e55d1d0a678cc1b61702868b353ba518666507ef8e08162ea442c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-164429-927464b/marvel-linux-arm64"
    sha256 "6c06513005a7b342975914bafa3dd64209076005462eef92bcd20d92eb57dc25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-164429-927464b/marvel-linux-amd64"
    sha256 "293eda60f98110052ab217a0c7bd25fd793d3c153961b111276c33da22ed37a8"
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
