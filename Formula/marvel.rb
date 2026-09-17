class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.120858.18ea860"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-120858-18ea860/marvel-darwin-arm64"
    sha256 "51ef834688c7c6f0b8619dfb76a508e998af988bd1e5fe5e35727b4cc4273fce"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-120858-18ea860/marvel-darwin-amd64"
    sha256 "f280fd2e6488bfac53ff34f1a8495f968cd40dac1a88f15de4e8a94a5d483be6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-120858-18ea860/marvel-linux-arm64"
    sha256 "a51196f5559e488443c105b307ef37c1c79ef8d979c5c6d3bb9620f5acbd9336"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-120858-18ea860/marvel-linux-amd64"
    sha256 "fbcba57237888e1a896adc36345020b5ddcc55822b114e81cdd8d1698b25cd83"
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
