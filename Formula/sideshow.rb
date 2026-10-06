class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261006.235128.3f032fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235128-3f032fd/sideshow-darwin-arm64"
    sha256 "8da0a5226ac33f3cc96ea95c94c1948b43baae57e76dc488255b20aad18784b0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235128-3f032fd/sideshow-darwin-amd64"
    sha256 "972a80826ef6f676f36286265c5f1a2689dc944973029f7321d1fc45863c14f6"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235128-3f032fd/sideshow-linux-amd64"
    sha256 "ee225b78a4b9542322871462e370d65dee2fde634ded14e6c74fb8c796ee71bd"
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
