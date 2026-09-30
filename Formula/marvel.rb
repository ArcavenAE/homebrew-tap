class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.163841.7949a00"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163841-7949a00/marvel-darwin-arm64"
    sha256 "33459f9453488252c9db447287d1db5e326e672468647dabcaa650066a2f1f2c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163841-7949a00/marvel-darwin-amd64"
    sha256 "6beeb261d8df5729aa805fa86ebbb1e3bc12b949d544326a33d0e5e720c93d44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163841-7949a00/marvel-linux-arm64"
    sha256 "7abcdbabcb53b6466048fdaa45c0dc30a8dbfbc84e9729a94c7f456c828ddd49"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163841-7949a00/marvel-linux-amd64"
    sha256 "c846f866832dd097a832bb2cd2d074017cd723aec2d63491ec5a379e38832e5d"
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
