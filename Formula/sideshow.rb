class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.114714.3cd4e2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-114714-3cd4e2d/sideshow-darwin-arm64"
    sha256 "7493c79d36e950b3d29d096826703c50b52863d765d6031c89cd6468de59d2ec"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-114714-3cd4e2d/sideshow-darwin-amd64"
    sha256 "d805f1b9d8b13f6a9971f3c10c611f5ea8d2254410a375a02a490c21a679deb0"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-114714-3cd4e2d/sideshow-linux-amd64"
    sha256 "87e6a84bb28c3b3bcc43c95f476213f8d025bb323995d1af31f2f2e56a78ec04"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
