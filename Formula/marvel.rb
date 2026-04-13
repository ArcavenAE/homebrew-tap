class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260413.054538.659ceb1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-054538-659ceb1/marvel-darwin-arm64"
    sha256 "bfa9c846d54ac3ffe72794f9a76fbf6889e06f7db44918b2cbfff4b63e42422f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-054538-659ceb1/marvel-darwin-amd64"
    sha256 "4f523941f8e43371564a67c8943d822a6915e51d28bd3f06f4bdb6f14f54ccf8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-054538-659ceb1/marvel-linux-amd64"
    sha256 "4026511528a37ed0c77349794046ffa72df56671037324ad65c776adc241669b"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
