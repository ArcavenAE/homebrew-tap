class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.063525.e7788d8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063525-e7788d8/marvel-darwin-arm64"
    sha256 "016f7596bff73f693354e24d915dc52b3996fece164d8950ea8c8d0e45bab9b5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063525-e7788d8/marvel-darwin-amd64"
    sha256 "beed941c89b65e483059e9ff2bb86336849122f565544a5675676007fdc9bc35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063525-e7788d8/marvel-linux-arm64"
    sha256 "55a826b5b4a70c1dbdcd1f78dfbc6d3886115991c10ca692cac396e34e0e19db"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063525-e7788d8/marvel-linux-amd64"
    sha256 "0226ca9c7063179bce503919dd682e5b2b85027ecc4979eddf9c476248f15ab6"
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
