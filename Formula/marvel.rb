class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.171304.a6a7ccf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171304-a6a7ccf/marvel-darwin-arm64"
    sha256 "1c8ad488e08c3d4295b5bd904af51b691f0422e0b9240fb0446dbd1c92f0908c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171304-a6a7ccf/marvel-darwin-amd64"
    sha256 "cd9647047a506f5516598754a7e689772b9de3f627531eaaf3b2bf11d5761118"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171304-a6a7ccf/marvel-linux-arm64"
    sha256 "797b16060ed394943a6d461d1d4937c318d3a7379a781ce1076abba5bfe5506f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171304-a6a7ccf/marvel-linux-amd64"
    sha256 "6ca6b4302c7374e8e2a526ddf8abb956ec287cb22706c726a47d430e3b10001f"
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
