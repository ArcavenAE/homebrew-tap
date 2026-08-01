class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.044721.7ace7e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-044721-7ace7e8/sideshow-darwin-arm64"
    sha256 "369bf072916870e2d0713fc7a9ac004471e11b3f3091528af686c1d9dbbe84d0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-044721-7ace7e8/sideshow-darwin-amd64"
    sha256 "f9f3e37b9baed9c1c6f27fea648c21b0d9c16e17de63375acd4f495ee3da1cfe"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-044721-7ace7e8/sideshow-linux-amd64"
    sha256 "1e9dbbc8a58c43d190e1b14b25da6a3fd7aa5e38a2bb46ddd6660a26780cd413"
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
