class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.025958.c8e2c48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-025958-c8e2c48/marvel-darwin-arm64"
    sha256 "a2fae65280107e4605c8c253c6c71813ee6713909070259834c58e3c3e7292b9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-025958-c8e2c48/marvel-darwin-amd64"
    sha256 "d566fab9c560440965ce9c1efa8bf4db90f81e400a686ed13039daf327c8355f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-025958-c8e2c48/marvel-linux-arm64"
    sha256 "4f8115d3940c67281f0972012a1cd284c5b31b20e749d3ade43001e52db54715"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-025958-c8e2c48/marvel-linux-amd64"
    sha256 "2308717db7dbec54834ad157319d64eda5462849c13ee461a012039ca64a1b0c"
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
