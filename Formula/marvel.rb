class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.063435.186c4f4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-063435-186c4f4/marvel-darwin-arm64"
    sha256 "142ab374ab7835c082c44380a656f4723642a46cf103e29d08106e447ffa1ba3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-063435-186c4f4/marvel-darwin-amd64"
    sha256 "10e6e45eaeb66d8f8b384098092151aec87d9cd24243d7cea543f86ff54396a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-063435-186c4f4/marvel-linux-arm64"
    sha256 "b70138b70acb07d8f07b169c70e7f187d867d5c69a796051fabd955332204f3c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-063435-186c4f4/marvel-linux-amd64"
    sha256 "00f2300663a5dec3237feaf423e37c9b822905f4144c55a906dd9d227fc2e491"
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
