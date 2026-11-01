class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.021300.a60052f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021300-a60052f/marvel-darwin-arm64"
    sha256 "ff1d0488623c425657c9135d9bf6a2dda9ea5878ad50b461bbe8589c7bc3b6af"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021300-a60052f/marvel-darwin-amd64"
    sha256 "7550b5f8ea605d3d2f1fc1f374a3695b47d36d946c3f3ef58fc6e246bbcb5548"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021300-a60052f/marvel-linux-arm64"
    sha256 "863e1c6282496550afcf2584a1bc8371af2c2f85ce34863fff8ca874c9238624"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021300-a60052f/marvel-linux-amd64"
    sha256 "f3d04eaa8b105cd1d024a1743eda74068c4b8fd1953b7290279cd1f926eabe33"
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
