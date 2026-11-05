class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.145316.efaedf7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-145316-efaedf7/marvel-darwin-arm64"
    sha256 "24c5f3cb2dc91d3327a4997246c33d01ad7f4f9099f5915cd98239e607220cd8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-145316-efaedf7/marvel-darwin-amd64"
    sha256 "6d859374001cf5c2e3438cb18044000101b0114eae719683bd8e12bcb5a7c6c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-145316-efaedf7/marvel-linux-arm64"
    sha256 "10db42fbf97a720619f3d0623a2c8b990d3f02397589f8f3c60c31d1f2c81c52"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-145316-efaedf7/marvel-linux-amd64"
    sha256 "d4f939446821b758ca15b0e8b26600777591d7eb93456a6b5b6b6270b2e4f41a"
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
