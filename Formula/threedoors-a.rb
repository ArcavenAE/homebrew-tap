class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.185229.762639c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185229-762639c/threedoors-a-darwin-arm64"
    sha256 "ea1c75a2ca8a04b84c2a739b38660969eddfe818730fbe4dc35b70d06aa81779"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185229-762639c/threedoors-a-darwin-amd64"
    sha256 "820d9742d093e2df7e0ee5658a2edab7eb787b32761b7848d1e2800114a0dc41"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185229-762639c/threedoors-a-linux-amd64"
    sha256 "9f2d2d856471b3caed518fe75a7332b6fd1742ebbfc0d18a8e342529a9a237cd"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
