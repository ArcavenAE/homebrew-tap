class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.060833.c4ddeca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-060833-c4ddeca/marvel-darwin-arm64"
    sha256 "9410eef9a486468929465817f143fa70af432bc47531a4e09c55e6272b6b2d9c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-060833-c4ddeca/marvel-darwin-amd64"
    sha256 "7f9cefea631ac9695e590c43ec56548043158c5acd0037f3da5d997ebd245a9f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-060833-c4ddeca/marvel-linux-arm64"
    sha256 "289b17c3f451ad1f274791915bc764c2a1d528d40224efd1248c6beb3dcf84f6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-060833-c4ddeca/marvel-linux-amd64"
    sha256 "76afc7ec0d7bf1217c4b87bfaa21c9e46628d071f1b3594428247e80b1099bf6"
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
