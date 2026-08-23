class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260823.204707.48c2e98"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204707-48c2e98/marvel-darwin-arm64"
    sha256 "1111f22ca90af40e19aecb475efab66e9e300c785b57d9fb84f282c4a3177963"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204707-48c2e98/marvel-darwin-amd64"
    sha256 "6a18257dbc2d961bd25df60dab5340d0c47ddc4e712bd127372954652a5371e2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204707-48c2e98/marvel-linux-arm64"
    sha256 "a933b27b5e5f4207c47fe800034809c362262172d383ee374c5c603fcd715ef8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204707-48c2e98/marvel-linux-amd64"
    sha256 "2f6fca818dd67574c4b2bfc7517c68dcfed99b481dae30691ff750d5ffa8a827"
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
