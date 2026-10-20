class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.121102.e4bb6ec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121102-e4bb6ec/marvel-darwin-arm64"
    sha256 "6814a6634b264a2c7fb10c0a0fafc7181b15e82b2763a34eab986762f5bfc242"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121102-e4bb6ec/marvel-darwin-amd64"
    sha256 "62eae8888b8ccf324e117190fcb684f8e5c036794e7b0d4a4bc0b08bedf4a962"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121102-e4bb6ec/marvel-linux-arm64"
    sha256 "94bf18718c4357680a699e91be98ac576622499f5f9b38185f185e2f4dbf276a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121102-e4bb6ec/marvel-linux-amd64"
    sha256 "830e0685c3b8ff07bcd7afcb01e34f061ccf6915af20b9066fa8e3a419bfa8cc"
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
