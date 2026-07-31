class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.225904.ac7a16f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225904-ac7a16f/marvel-darwin-arm64"
    sha256 "977757c4a8c000356f9c870aa3bb6a5bb67d22aee04f48786c33d67ebf37bf9d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225904-ac7a16f/marvel-darwin-amd64"
    sha256 "ca5e06c056ec216e105360522e6bf11b4bdd4007876ccabb34393e25ff78629b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225904-ac7a16f/marvel-linux-arm64"
    sha256 "32a52ea0109b1742ff867f5a80251465638e6d98103aa34f0232bc55907375da"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225904-ac7a16f/marvel-linux-amd64"
    sha256 "096394c8b33696e02ee115498327feaf96511964832ece92026eec8cdbf4f9dc"
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
