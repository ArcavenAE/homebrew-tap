class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.150058.337da64"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150058-337da64/marvel-darwin-arm64"
    sha256 "9e7cc564feeb01be2566a05af7102b9164468779a9e8858317d1d1afae768af4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150058-337da64/marvel-darwin-amd64"
    sha256 "750af556d64f0da1b0906ab3c1f4a71468b68c49a23bb3691f76cc6605d312b3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150058-337da64/marvel-linux-arm64"
    sha256 "f92a60dfe489f3b04cfd4b2ec7dd91f909ebae77fdd63fc9675cb44e59d01e6b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150058-337da64/marvel-linux-amd64"
    sha256 "63f06a2e21749396356a28495559e73e58cb757248493b0b6bffd50e3b76ac34"
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
