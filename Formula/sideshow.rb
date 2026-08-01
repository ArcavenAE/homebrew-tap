class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.162421.4f90eaa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-162421-4f90eaa/sideshow-darwin-arm64"
    sha256 "0d0aaceefdf00820c8eec925c75d496164ac57addaccac15e0676800171e8b88"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-162421-4f90eaa/sideshow-darwin-amd64"
    sha256 "c38f9d33ee2acd2488cab7e47a10df36d5414e638842596ebbeab88bd1bc9245"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-162421-4f90eaa/sideshow-linux-amd64"
    sha256 "c2bbc9f6ae7176222ee9780ad84a66a18f8e7234e6c1e8d1076b5cfa148e410f"
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
