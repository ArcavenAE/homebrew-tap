class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.170431.f43f63f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-170431-f43f63f/marvel-darwin-arm64"
    sha256 "96c414296bff8a7ffaa67bc52fb4d2d878b9d044215ef9eac7e0b4403845e488"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-170431-f43f63f/marvel-darwin-amd64"
    sha256 "8b299b6c733d32413618a87c781e898bfe29ba43fa76a9a9f818f970319bd351"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-170431-f43f63f/marvel-linux-arm64"
    sha256 "2c85451d74d1ef1fff2da973b4e92d794128e80f430ced04a9143cdbe787da71"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-170431-f43f63f/marvel-linux-amd64"
    sha256 "c002f31457a8ef95ea5bc4cf270f7af1af2a0f8b13b2577bfbd162dddc90572d"
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
