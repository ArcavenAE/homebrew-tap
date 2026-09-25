class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.184901.a12aa5b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184901-a12aa5b/marvel-darwin-arm64"
    sha256 "3944e4828b9d83f68539fa85ad5a39348fb8cdb1807ab2aec3b291eb7e2028fc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184901-a12aa5b/marvel-darwin-amd64"
    sha256 "09fbd3c48205055274199021623e4b14e1dea19e4b8c48df89c3ff221e18cec0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184901-a12aa5b/marvel-linux-arm64"
    sha256 "2aacf2d5e0b5a0970e6595dacc2a5c832d7c976e87176774b4765639ce3334d2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-184901-a12aa5b/marvel-linux-amd64"
    sha256 "62bc222edd3cbec7367635c2d005931e0269df2b2e48c0aad9f5a379d36406d5"
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
